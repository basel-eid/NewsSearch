import 'package:flutter/material.dart';
import 'package:newssearch/Providers/news_providers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  String textController = "business";

  HomePage({super.key});

//dcasc
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            TextFormField(
              onChanged: (value) {
                textController = value;
              },
              decoration: InputDecoration(suffix: Consumer<NewsProviders>(
                builder: (context, value, child) {
                  SizedBox(height: 20,);
                  return FloatingActionButton(
                    onPressed: () {
                      value.fetchApi(category: textController);
                    },
                    child: Text("change"),
                  );
                },
              ),),
            ),
            SizedBox(height: 20,),

            Padding(
                padding: const EdgeInsets.only(
                    top: 120.0, left: 20, right: 20, bottom: 20),
                child: Consumer<NewsProviders>(
                  builder: (context, value, child) {
                    if (value.model == null) {
                      value.fetchApi(category: "business");
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                      value.model!.data[index]["image"]),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    value.model!.data[index]["title"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(value.model!.data[index]["description"])
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: value.model!.data.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    );
                  },
                )),
          ],
        ));
  }
}

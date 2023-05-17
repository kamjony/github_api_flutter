import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api/pages/home/components/items.dart';
import 'package:github_api/pages/home/components/sort_by.dart';
import 'package:github_api/pages/home/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller = Get.find();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Github API'),
        ),
        body: Obx(() => !_controller.isLoading.value
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: SortBy(),
                  ),
                  Expanded(
                    child: ListView.separated(
                      controller: _controller.scrollController,
                      padding: const EdgeInsets.all(20),
                      shrinkWrap: true,
                      itemCount: _controller.items.length + 1,
                      itemBuilder: (context, index) {
                        if (index == _controller.items.length) {
                          return const CupertinoActivityIndicator();
                        }

                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('/details', arguments: _controller.items[index]);
                          },
                          child: Items(
                            fullName: _controller.items[index].fullName!,
                            shortName: _controller.items[index].name!,
                            stars: _controller.items[index].stargazersCount!,
                            watchers: _controller.items[index].watchers!,
                            forks: _controller.items[index].forks!,
                          ),
                        );
                      },
                      separatorBuilder: (context, int index) {
                        return const SizedBox(height: 10);
                      },
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              )));
  }
}

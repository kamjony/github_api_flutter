import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api/pages/details/components/avatar.dart';
import 'package:github_api/pages/details/components/repo_details_text.dart';
import 'package:github_api/pages/details/details_controller.dart';

class DetailsView extends StatelessWidget {
  final DetailsController _controller = Get.find();

  DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Avatar(
                imgUrl: _controller.item.owner!.avatarUrl!,
              )),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  width: MediaQuery.of(context).size.width * 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Repo Details ',
                            style: TextStyle(
                                color: Colors.black, fontSize: 36, fontWeight: FontWeight.w600)),
                        RepoDetailsText(text: 'Name: ${_controller.item.owner!.login}'),

                        RepoDetailsText(text: 'Type: ${_controller.item.owner!.type}'),

                        RepoDetailsText(text: 'Description: ${_controller.item.description}'),

                        RepoDetailsText(text: 'Created At: ${_controller.formatDate(_controller.item.createdAt!)}'),

                        RepoDetailsText(text: 'Updated At: ${_controller.formatDate(_controller.item.updatedAt!)}'),

                        RepoDetailsText(text: 'Main Language: ${_controller.item.language}'),

                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

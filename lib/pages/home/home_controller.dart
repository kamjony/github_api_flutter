import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:github_api/data/api.dart';
import 'dart:developer' as dev;

import 'package:github_api/models/github_response_model.dart';

class HomeController extends GetxController{
  RxBool isLoading = RxBool(false);
  RxList<Item> items = RxList();
  Map<String, dynamic> params = {};
  RxString selectedSort = RxString('stars');
  late ScrollController scrollController;
  int currentPage = 1;

  @override
  void onInit() {
    scrollController = ScrollController();
    if (getSortValue() != null) {
      selectedSort.value = getSortValue()!;
      params['sort'] = selectedSort.value;
      params['page'] = 1;
    } else {
      selectedSort.value = 'stars';
      params['sort'] = selectedSort.value;
      params['page'] = 1;
    }
    getAllRepos();

    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        loadMoreRepos();
      }
    });
    super.onInit();
  }

  String? getSortValue() {
    final box = GetStorage();
    return box.read('sort');
  }

  Future<bool> saveSortValue(String? value) async {
    final box = GetStorage();
    await box.write('sort', value);
    return true;
  }

  void onSortItemSelected(String item) {
    selectedSort.value = item;
    saveSortValue(selectedSort.value);
    params['sort'] = item;
    params['page'] = 1;
    currentPage = 1;
    getAllRepos();
  }

  void getAllRepos() async {
    isLoading.value = true;
    params['q'] = 'flutter';
    params['order'] = 'desc';
    params['per_page'] = 10;
    var result = await api.fetchRepos(params);
    if (result != null) {
      isLoading.value = false;
      items.value = result.items!;
    } else {
      isLoading.value = false;
      Get.snackbar('Error', 'Could not fetch data please try again later');
    }
  }

  void loadMoreRepos() async {
    currentPage++;
    params['page'] = currentPage;
    var result = await api.fetchRepos(params);
    if (result != null) {
      items.addAll(result.items!);
    } else {
      Get.snackbar('Error', 'Could not fetch data please try again later');
    }
  }

}
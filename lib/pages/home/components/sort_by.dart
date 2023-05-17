import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api/pages/home/home_controller.dart';

class SortBy extends StatelessWidget {
  final HomeController _controller = Get.find();
  SortBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Sort by: ',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            _controller.onSortItemSelected('stars');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: ShapeDecoration(
              color: _controller.selectedSort.value == 'stars'
                  ? Colors.blue[300]
                  : Colors.white,
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.blue[900]!,
                ),
              ),
            ),
            child: Text(
              'stars',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: _controller.selectedSort.value == 'stars'
                      ? FontWeight.w600
                      : FontWeight.w400),
            ),
          ),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: () {
            _controller.onSortItemSelected('updated');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: ShapeDecoration(
              color: _controller.selectedSort.value == 'updated'
                  ? Colors.blue[300]
                  : Colors.white,
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.blue[900]!,
                ),
              ),
            ),
            child: Text(
              'updated at',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: _controller.selectedSort.value == 'updated'
                      ? FontWeight.w600
                      : FontWeight.w400),
            ),
          ),
        )
      ],
    );
  }
}

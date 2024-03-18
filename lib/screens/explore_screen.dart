import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';


class ExploreScreen extends StatefulWidget {


  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  final mockService = MockFooderlichService();
  late final ScrollController _controller;
  final bool _useController = true;

  void _handleControllerNotification() {
    if(_controller.position.atEdge) {
      if(_controller.position.pixels == 0) {
        print("I'm at the top!!");
      } else {
        print("I'm at the bottom!!");
      }
    }
  }

  void initState() {
    _controller = ScrollController();
    if(_useController) {
      _controller.addListener(_handleControllerNotification);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView (
                scrollDirection: Axis.vertical,
                controller: _controller,
                children: [
                  TodayRecipeListView(recipes: snapshot.data!.todayRecipes),
                  const SizedBox(height: 16),
                  FriendPostListView(friendPosts: snapshot.data!.friendPosts),
                ]
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}
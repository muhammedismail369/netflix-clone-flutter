import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';

import '../../core/colors/colors.dart';
import '../../core/constants.dart';
import 'widgets/coming_soon_widget.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              kWidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kWidth,
            ],
            bottom: TabBar(
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              isScrollable: true,
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's watching",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            const ComingSoonList(key: Key('coming_soon')),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  // Widget _buildComingSoon() {
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
  //   );
  // }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (
        BuildContext context,
        index,
      ) =>
          const SizedBox(),
      // const EveryonesWatchingWidget(),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      } else if (state.hasError) {
        return const Center(child: Text('Error while fetching data'));
      } else if (state.ComingSoonList.isEmpty) {
        return const Center(child: Text('Coming soon list is empty'));
      } else {
        return ListView.builder(
            itemCount: state.ComingSoonList.length,
            itemBuilder: (BuildContext context, index) {
              final movie = state.ComingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              return ComingSoonWidget(
                id: movie.id.toString(),
                month: 'MAR',
                day: '11',
                posterPath: '$imageAppendUrl${movie.posterPath}',
                movieName: movie.originalTitle ?? 'No title provided',
                description: movie.overview ?? 'No description provided',
              );
            });
      }
    });
  }
}

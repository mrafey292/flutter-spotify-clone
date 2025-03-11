import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:red/common/widgets/appbar/app_bar.dart';
import 'package:red/core/configs/assets/app_images.dart';
import 'package:red/core/configs/assets/app_vectors.dart';
import 'package:red/core/configs/theme/app_colors.dart';
import 'package:red/presentation/home/widgets/news_songs.dart';
import 'package:red/presentation/home/widgets/play_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            const SizedBox(height: 20),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                children: [
                  NewsSongs(),
                  Container(),
                  Container(),
                  Container(),
                ],
                controller: _tabController,
              ),
            ),
            PlayList(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homeTopCard)),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Image.asset(AppImages.homeArtist),
              )),
        ]),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      indicatorColor: AppColors.primary,
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.grey,
      tabs: [
        Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        Text(
          'Videos',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        Text(
          'Artists',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        Text(
          'Podcasts',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

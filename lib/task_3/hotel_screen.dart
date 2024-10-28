import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mobile_challenge/constents/colors.dart';
import 'package:mobile_challenge/constents/text_styles.dart';
import 'package:mobile_challenge/utils/custom_navigator.dart';
import 'package:mobile_challenge/widgets/vertical_scroller.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 80,
        leading: BlurredIconButton(
          iconPath: "assets/icons/arrow_back_ios.svg", 
          onPressed: () => context.pop()
        ),
        centerTitle: true,
        title: const Text(
          "View",
          style: TextStyles.style6
        ),
      ),
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/hotel.png"),
            fit: BoxFit.cover
          )
        ),
        child: VerticalScroller(
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      DragableSpotTool(
                        initialOffset: Offset(190, 120),
                      )
                    ],
                  )
                ),
              ),
              SizedBox(
                height: 250,
                child: PageView(
                  controller: PageController(
                    initialPage: 2,
                  ),
                  children: const [
                    HotelDetail(),
                    HotelDetail(),
                    HotelDetail()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DragableSpotTool extends StatefulWidget {
  const DragableSpotTool({
    super.key, 
    required this.initialOffset, 
  });

  final Offset initialOffset;

  @override
  State<DragableSpotTool> createState() => _DragableSpotToolState();
}

class _DragableSpotToolState extends State<DragableSpotTool> {
  late Offset currentOffset;

  @override
  void initState() {
    currentOffset = widget.initialOffset;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: currentOffset,
      child: Draggable(
        feedback: const Material(
          color: Colors.transparent,
          child: SpotTip(
            title: "La-Hotel", 
            surface: "2.09 mi", 
            imagePath: "assets/images/spot1.png"
          ),
        ),
        childWhenDragging: const SpotTip(
          title: "La-Hotel", 
          surface: "2.09 mi", 
          imagePath: "assets/images/spot1.png"
        ),
        child: const SpotTip(
          title: "La-Hotel", 
          surface: "2.09 mi", 
          imagePath: "assets/images/spot1.png"
        ),
        onDragEnd: (details) {
          setState(() {
            if (details.offset.dx < 20) {
              currentOffset = Offset(
                20, 
                details.offset.dy
              );
              return;
            }

            if (details.offset.dx > MediaQuery.of(context).size.width - 200) {
              currentOffset = Offset(
                MediaQuery.of(context).size.width - 200, 
                details.offset.dy
              );
              return;
            }

            if (details.offset.dy < 82) {
              currentOffset = Offset(
                details.offset.dx, 
                82
              );
              return;
            }

            if (details.offset.dy > MediaQuery.of(context).size.height - 400) {
              currentOffset = Offset(
                details.offset.dx, 
                MediaQuery.of(context).size.height - 400
              );
              return;
            }

            currentOffset = details.offset;
          });
        },
      )
    );
  }
}

class HotelDetail extends StatelessWidget {
  const HotelDetail({
    super.key, 
    this.isSelected = false, 
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: CustomColors.grey3.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Niladri Reservoir",
                  style: TextStyles.style6,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/icons/star.svg"),
                    const SizedBox(width: 3),
                    Text(
                      "4.7",
                      style: TextStyles.style2.copyWith(
                        color: Colors.white
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            const Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DtailTile(
                        iconPath: "assets/icons/location.svg", 
                        info: "Tekergat, Sunamgnj"
                      ),
                    ),
                    Users()
                  ],
                ),
                SizedBox(height: 3),
                DtailTile(
                  iconPath: "assets/icons/clock.svg", 
                  info: "45 Minutes"
                )
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: (){}, 
                child: const Text("See On Map")
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SpotTip extends StatelessWidget {
  const SpotTip({
    super.key, 
    required this.title, 
    required this.surface, 
    required this.imagePath
  });

  final String title, surface, imagePath;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.grey3.withOpacity(0.8)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(imagePath)
                    )
                  ),
                ),
                const SizedBox(width: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.style9
                      ),
                      Text(
                        surface,
                        style: TextStyles.style10
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0.7, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 40,
                  width: 2,
                  color: CustomColors.grey3.withOpacity(0.9),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.grey3.withOpacity(0.9)
                  ),
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.blue1
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Users extends StatelessWidget {
  const Users({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        avatarPic(backgroundColor: Colors.red),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: avatarPic(backgroundColor: Colors.green)
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: avatarPic(backgroundColor: Colors.blue),
        ),
        Container(
          padding: const EdgeInsets.only(left: 90),
          child: Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: CustomColors.grey2,
              shape: BoxShape.circle
            ),
            child: const Text(
              "+50",
              style: TextStyles.style8
            ),
          ),
        ),
      ],
    );
  }

  SizedBox avatarPic({required Color backgroundColor}) {
    return SizedBox(
        height: 25,
        width: 25,
        child: CircleAvatar(backgroundColor: backgroundColor)
      );
  }
}

class DtailTile extends StatelessWidget {
  const DtailTile({
    super.key, 
    required this.iconPath, 
    required this.info
  });

  final String iconPath;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            info,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.style7,
          ),
        )
      ],
    );
  }
}

class BlurredIconButton extends StatelessWidget {
  const BlurredIconButton({
    super.key, 
    required this.iconPath, 
    required this.onPressed
  });

  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: IconButton(
              icon: const SizedBox(),
              style: IconButton.styleFrom(
                backgroundColor: CustomColors.black1
              ),
              onPressed: onPressed,
            ),
          ),
        ),
        // ignore: deprecated_member_use
        SvgPicture.asset(iconPath, color: Colors.white),
      ],
    );
  }
}
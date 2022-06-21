import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/content_model.dart';
import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(featuredContent: featuredContent),
      desktop: _ContentHeaderDesktop(featuredContent: featuredContent),
      tablet: _ContentHeaderDesktop(featuredContent: featuredContent),
    );
  }
}

// ignore: unused_element
class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;
  const _ContentHeaderDesktop({required this.featuredContent});

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController _controller;
  bool _isMuted = false;
  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((_) {
            setState(() {});
          })
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          },
        );
      },
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.isInitialized
                ? _controller.value.aspectRatio
                : 2.344,
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : Image(
                    image: AssetImage(widget.featuredContent.imageUrl),
                    fit: BoxFit.cover,
                  ),
          ),
          AspectRatio(
            aspectRatio: _controller.value.isInitialized
                ? _controller.value.aspectRatio
                : 2.344,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            right: 60,
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.featuredContent.titleImageUrl!,
                  width: 250,
                ),
                const SizedBox(height: 15),
                Text(
                  widget.featuredContent.description!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(
                            2.0,
                            4.0,
                          ),
                          blurRadius: 6.0),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    ElevatedButton.icon(
                      label: Text(
                        _controller.value.isPlaying ? 'Pause' : 'Play',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.black,
                      ),
                      onPressed: () => {
                        setState(
                          () {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          },
                        )
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton.icon(
                      label: const Text(
                        'More Info',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.black,
                      ),
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    _controller.value.isInitialized
                        ? IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _isMuted
                                    ? _controller.setVolume(100)
                                    : _controller.setVolume(0);
                                _isMuted = _controller.value.volume == 0;
                              });
                            },
                            icon: Icon(
                              _isMuted ? Icons.volume_up : Icons.volume_off,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        : const Text(''),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  const _ContentHeaderMobile({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 510,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 510,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Image.asset(
                featuredContent.titleImageUrl!,
                width: 180,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  VerticalIconButton(
                    icon: Icons.add,
                    title: 'List',
                  ),
                  PlayButton(),
                  VerticalIconButton(
                    icon: Icons.info_outline,
                    title: 'Info',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

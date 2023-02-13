import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music/song.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var favorite = false;
  var favoriteheat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: const LinearGradient(//ikki tomonlama rang berish
                    colors: [
              const Color(0xFF3AA575),
              const Color(0xFF4CD4A9),
            ])),
          ),
          title: const Text('MusicPlayer'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (favorite) {
                      favorite = false;
                    } else {
                      favorite = true;
                    }
                  });
                },
                icon: Icon(
                  favorite ? Icons.star : Icons.star_border,
                )),
          ]),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF3AA575),
            Color(0xFF5AA575),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image(
                      image: Song().albumCover,
                      width: MediaQuery.of(context).size.width * .8,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Song().title,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (favoriteheat) {
                                  favoriteheat = false;
                                } else {
                                  favoriteheat = true;
                                }
                              });
                            },
                            icon: Icon(
                              favoriteheat
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      children: [
                        Text(
                          Song().singerName,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: const LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        value: .3,
                        minHeight: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF25D0DE),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, //spaceBetween ikki yonga otvoradi widgetni
                        children: const [
                          const Text(
                            '1:24',
                            style: const TextStyle(color: Colors.black38),
                          ),
                          const Text(
                            '1:24',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

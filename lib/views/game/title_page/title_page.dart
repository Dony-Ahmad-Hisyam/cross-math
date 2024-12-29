import 'dart:ffi';

import 'package:flutter/material.dart';

class TitlePageView extends StatefulWidget {
  const TitlePageView({Key? key}) : super(key: key);

  @override
  _TitlePageViewState createState() => _TitlePageViewState();
}

class _TitlePageViewState extends State<TitlePageView> {
  int difficultySettingInt = 2;

  Widget _difficultySelect() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 180),
        _difficultyOption(1, "img/easy.png"),
        SizedBox(height: 40),
        _difficultyOption(2, "img/normal.png"),
        SizedBox(height: 40),
        _difficultyOption(3, "img/hard.png"),
        SizedBox(height: 80),
      ],
    );
  }

  Widget _difficultyOption(int value, String assetPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          difficultySettingInt = value;
        });
      },
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 1), // Atur jarak antar level
        child: Opacity(
          opacity: difficultySettingInt == value ? 1.0 : 0.5,
          child: Image.asset(
            assetPath,
            width: 240,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _titlePage() {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center, // Menyusun widget di tengah secara vertikal
      crossAxisAlignment: CrossAxisAlignment
          .center, // Menyusun widget di tengah secara horizontal
      children: [
        _difficultySelect(),
        GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            '/board',
            arguments: {
              "boardSize": 5,
              "blanks": difficultySettingInt,
            },
          ),
          child: Image.asset(
            "img/start.png",
            width: 180,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("img/background.png"),
            fit: BoxFit.cover, // Memastikan gambar memenuhi seluruh layar
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            // Memastikan seluruh konten berada di tengah layar
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: _titlePage(),
            ),
          ),
        ),
      ),
    );
  }
}

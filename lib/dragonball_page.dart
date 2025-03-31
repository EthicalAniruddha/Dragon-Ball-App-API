import 'dart:convert' as convert;
import 'dart:developer';
import 'package:ball/constants.dart';
import 'package:ball/dragonballcharacters.dart';
import 'package:ball/info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class DragonballPage extends StatefulWidget {
  const DragonballPage({super.key});

  @override
  State<DragonballPage> createState() => _DragonballPageState();
}

class _DragonballPageState extends State<DragonballPage> {
  final TextEditingController _searchController = TextEditingController();
  DragonBallCharacter? _character;
  bool _isLoading = false;

  Future<DragonBallCharacter?> getData(String characterId) async {
    var url = Uri.https('dragonball-api.com', '/api/characters/$characterId');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return DragonBallCharacter.fromJson(
          convert.jsonDecode(response.body) as Map<String, dynamic>,
        );
      } else {
        return null; // Return null if character not found or API error
      }
    } catch (e) {
      log('Error fetching data: $e');
      return null;
    }
  }

  void _searchCharacter() async {
    setState(() {
      _isLoading = true;
      _character = null;
    });

    final character = await getData(_searchController.text);
    setState(() {
      _character = character;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            Constants.title,
            style: GoogleFonts.nabla(fontSize: 40, fontWeight: FontWeight.w600),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        backgroundColor: Constants.titleColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Info();
                  },
                ),
              );
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      backgroundColor: Constants.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter Character ID',
                labelStyle: GoogleFonts.audiowide(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: Constants.writeText,
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: _searchCharacter,
              child: Text('Search', style: Constants.buttonText),
            ),
            SizedBox(height: 20),
            if (_isLoading) CircularProgressIndicator(),
            if (_character != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(_character!.image),
                      Text(
                        'Name: ${_character!.name}',
                        style: Constants.writeText,
                      ),
                      Text('Ki: ${_character!.ki}', style: Constants.writeText),
                      Text(
                        'Max Ki: ${_character!.maxKi}',
                        style: Constants.writeText,
                      ),
                      Text(
                        'Race: ${_character!.race}',
                        style: Constants.writeText,
                      ),
                      Text(
                        'Gender: ${_character!.gender}',
                        style: Constants.writeText,
                      ),
                      Text(
                        'Description: ${_character!.description}',
                        style: Constants.writeText,
                      ),
                      // Add more fields as needed
                    ],
                  ),
                ),
              ),
            if (_character == null &&
                !_isLoading &&
                _searchController.text.isNotEmpty)
              const Text('Character Not Found'),
          ],
        ),
      ),
    );
  }
}

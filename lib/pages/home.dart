import 'package:flutter/material.dart';
import 'detail.dart';
import '../models/culinaryModels.dart';
import 'login.dart';

class CulinaryListPage extends StatefulWidget {
  const CulinaryListPage({super.key});

  @override
  State<CulinaryListPage> createState() => _CulinaryListPageState();
}

class _CulinaryListPageState extends State<CulinaryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Culinarizz", style: TextStyle(color: Colors.deepPurple),),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app, 
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: culinaryList.length,
        itemBuilder: (context, index) {
          final culi = culinaryList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.network(
                culi.imageUrl, 
                width: 60, 
                height: 60, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
              ),
              title: Text(culi.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kategori: ${culi.category}"),
                  Text(culi.origin, style: const TextStyle(color: Colors.deepPurple)),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CulinaryDetailPage(culinary: culi)),
                ).then((_) {
                  setState(() {}); 
                });
              },
            ),
          );
        },
      ),
    );
  }
}
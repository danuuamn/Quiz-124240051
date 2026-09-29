import 'package:flutter/material.dart';
import '../models/culinaryModels.dart';

class CulinaryDetailPage extends StatefulWidget {
  final Culinary culinary;
  const CulinaryDetailPage({super.key, required this.culinary});

  @override
  State<CulinaryDetailPage> createState() => _CulinaryDetailPageState();
}

class _CulinaryDetailPageState extends State<CulinaryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.culinary.name),
        actions: [
          IconButton(
            icon: Icon(
              widget.culinary.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.culinary.isFavorite ? Colors.red : Colors.black54,
            ),
            onPressed: () {
              setState(() {
                widget.culinary.isFavorite = !widget.culinary.isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.culinary.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.culinary.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_city, color: Colors.red, size: 20),
                      const SizedBox(width: 4),
                      Text(widget.culinary.origin, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Chip(label: Text(widget.culinary.category, style: const TextStyle(color: Colors.white)), backgroundColor: const Color.fromARGB(255, 14, 63, 102)),
                  const SizedBox(height: 8),
                  Chip(label: Text(widget.culinary.mainIngredient, style: const TextStyle(color: Colors.white)), backgroundColor: const Color.fromARGB(255, 128, 77, 2)),
                  const SizedBox(height: 8),
                  Chip(label: Text(widget.culinary.flavor, style: const TextStyle(color: Colors.white)), backgroundColor: const Color.fromARGB(255, 124, 113, 10)),
                  const SizedBox(height: 8),
                  Chip(label: Text(widget.culinary.spicyLevel, style: const TextStyle(color: Colors.white)), backgroundColor: const Color.fromARGB(255, 38, 87, 39)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.hourglass_empty, color: Colors.blue, size: 20),
                      const SizedBox(width: 4),
                      Text(widget.culinary.servingTime, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("Deskripsi:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.culinary.description, style: const TextStyle(fontSize: 16, height: 1.5)),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text("Link Wikipedia:", style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 4),
                      Text(widget.culinary.wikipediaUrl, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
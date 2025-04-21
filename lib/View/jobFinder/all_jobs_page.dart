import 'package:flutter/material.dart';
import 'package:reachify/Common/job_items.dart';
import 'package:reachify/Common/search_bar.dart';
import 'package:reachify/Model/job_opportunity_model.dart';

class AllJobsPage extends StatelessWidget {
  const AllJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: const Text(
          "See All Jobs",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MySearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 700,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children:
                      jobOpportunities
                          .map((job) => JobItems(job: job))
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

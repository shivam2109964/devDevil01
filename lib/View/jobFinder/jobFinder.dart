import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// add iconsax pacakge first to used
import 'package:iconsax/iconsax.dart';
import 'package:reachify/Common/job_items.dart';
import 'package:reachify/Common/search_bar.dart';
import 'package:reachify/Model/company_offer.dart';
import 'package:reachify/Model/job_category_model.dart';
import 'package:reachify/Model/job_opportunity_model.dart';
import 'package:reachify/View/jobFinder/all_jobs_page.dart';
import 'package:reachify/View/jobFinder/profile_page.dart';

class JobFinderAppHomepage extends StatelessWidget {
  const JobFinderAppHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: false,
        leading: IconButton(onPressed: () {}, icon: const Icon(Iconsax.menu5)),
        title: const Text(
          "Find a Perfect Job",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileSection(context),
              // for search bar
              const MySearchBar(),

              // for category items
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      jobCategories
                          .map(
                            (categories) => Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffF8F5F5),
                                    Color(0xffEEE8F3),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  categories.title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Company Offer",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 190,
                margin: const EdgeInsets.only(top: 10, left: 20),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children:
                      companyOffer
                          .map((job) => buildPopularCompaniesListTiles(job))
                          .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Job Oppertunities",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AllJobsPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 230,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children:
                      jobOpportunities
                          .map((job) => JobItems(job: job))
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopularCompaniesListTiles(CompanyOffer job) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: job.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(job.logo, height: 40),
                const SizedBox(height: 10),
                Text(
                  job.jobTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  job.location,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  children:
                      job.jobTypes
                          .map(
                            (type) => Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(child: Text(type)),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
          Positioned(
            right: 1,
            bottom: 1,
            top: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 30, right: 20),
              child: Text(
                job.salary,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector profileSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  "https://i.pinimg.com/736x/e8/e6/41/e8e64141f4c0ae39c32f9701ccea9a2e.jpg", // Update this link if you want a new picture
                  height: 60,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Snow", // Updated Name
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Flutter Developer",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset("assets/job-finder/ic_message.svg"),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}

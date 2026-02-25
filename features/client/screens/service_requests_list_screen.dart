// This file lists the client's service requests

import 'package:flutter/material.dart';

class ServiceRequestsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Requests'),
      ),
      body: FutureBuilder<List<ServiceRequest>>(
        future: fetchServiceRequests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final serviceRequests = snapshot.data;

          return ListView.builder(
            itemCount: serviceRequests?.length ?? 0,
            itemBuilder: (context, index) {
              final request = serviceRequests![index];
              return ListTile(
                title: Text(request.title),
                subtitle: Text(request.description),
                trailing: Text(request.status),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<ServiceRequest>> fetchServiceRequests() async {
    // Mocked data: Replace with the actual API call to fetch service requests
    return [
      ServiceRequest(title: 'Request 1', description: 'Description for request 1', status: 'Pending'),
      ServiceRequest(title: 'Request 2', description: 'Description for request 2', status: 'Completed'),
      ServiceRequest(title: 'Request 3', description: 'Description for request 3', status: 'In Progress'),
    ];
  }
}

class ServiceRequest {
  final String title;
  final String description;
  final String status;

  ServiceRequest({required this.title, required this.description, required this.status});
}
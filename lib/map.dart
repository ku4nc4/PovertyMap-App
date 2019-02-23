import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController mapController;
//  LatLng _center = const LatLng(-6.2717416,106.5642999);
  var location = new Location();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Future<LatLng> ambilLocation() async{
  Position currentLocation;
  currentLocation = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

  return LatLng(currentLocation.latitude,currentLocation.longitude);
}


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<LatLng>(
        future: ambilLocation(),
        builder: (context,AsyncSnapshot<LatLng> snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.done : return Scaffold(
              appBar: AppBar(
                title: Text('Maps Sample App'),
                backgroundColor: Colors.green[700],
              ),
              body: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: snapshot.data,
                  zoom: 11.0,
                ),
              ),
            );
            case ConnectionState.active : return new Container(width: 0.0, height: 0.0,);
            case ConnectionState.none : return new Container(width: 0.0, height: 0.0,);
            case ConnectionState.waiting : return new Container(width: 0.0, height: 0.0,);
          }

        },
      ),
    );
  }
}

class MapsDemo extends StatefulWidget {
  @override
  State createState() => MapsDemoState();
}

class MapsDemoState extends State<MapsDemo> {

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 300.0,
              height: 500.0,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: new CameraPosition(target: new LatLng(-6.2717416,106.5642999)),
              ),
            ),
          ),
//          RaisedButton(
//            child: const Text('Go to London'),
//            onPressed: mapController == null ? null : () {
//              mapController.animateCamera(CameraUpdate.newCameraPosition(
//                const CameraPosition(
//                  bearing: 270.0,
//                  target: LatLng(51.5160895, -0.1294527),
//                  tilt: 30.0,
//                  zoom: 17.0,
//                ),
//              ));
//            },
//          ),
//
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
  }
}


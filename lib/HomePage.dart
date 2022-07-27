
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    contact;
    super.initState();
  }
TextEditingController search  = TextEditingController();
  Contact? contact;
  bool isloading = false;
  List<Contact> contct = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Contact Details'),
      ),
      body: Column(
        children: [
        const  SizedBox(height: 20,),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height*.8,
              width: 300,
              child: FutureBuilder(
                future: getcontact(),
                builder: (context,AsyncSnapshot snapshot)
              {
if(snapshot.data == null ){
                return CircularProgressIndicator();
              } else{
              return  ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                     contact = snapshot.data[index];
                    return ListTile(
                      title: Text(contact!.displayName),
                      subtitle: Column(children: [
                        Text(contact!.phones[0])
                      ],),
                      trailing: IconButton(
                        onPressed: ()async{
                          try {
                            await FlutterPhoneDirectCaller.callNumber(
                                contact!.phones[0]);
                          } on MissingPluginException{
                            print('missingplugin exception');
                          }catch (e){
                            print(e.toString());
                          }
                          },
                        icon: Icon(Icons.phone),
                      ),

                    );
                  });
}

},)

              ),
          ),

        ],
      ),
      );

  }
  Future<List<Contact>> getcontact()async{
    bool isGranted = await Permission.contacts.status.isGranted;
    if(!isGranted) {
      isGranted= await Permission.contacts.request().isGranted;
    }
    if(isGranted){
      return await FastContacts.allContacts;
    }
    return [];
  }
}

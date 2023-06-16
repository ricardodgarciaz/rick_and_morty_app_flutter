import 'package:flutter/material.dart';


//Vista de la pagina de personajes
class PersonajesDetallesScreen extends StatelessWidget {


  const PersonajesDetallesScreen({super.key, required this.personaje, });
  
  final Map<String,dynamic> personaje;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
   
    return Scaffold(
      appBar: AppBar(
        title:  Text(personaje['name']),
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: 
                BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: NetworkImage(personaje['image'])
                  )
                )
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color.fromARGB(255, 0, 74, 134), width: 4.0) 
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children:[
                          const SizedBox(height: 50,),
                          const Text('Nombre:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 20,),
                          Text(personaje['name'], style: const TextStyle(fontSize: 20),),
                        ]
                      ), 
                      Row(
                        children:[
                          const SizedBox(height: 50,),
                          const Text('Status:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 20,),
                          Text(personaje['status'], style: const TextStyle(fontSize: 20),),
                        ]
                      ),  
                      Row(
                        children:[
                          const SizedBox(height: 50,),
                          const Text('Specie:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 20,),
                          Text(personaje['species'], style: const TextStyle(fontSize: 20),),
                        ]
                      ),  
                      Row(
                        children:[
                          const SizedBox(height: 50,),
                          const Text('Origen:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 20,),
                          Text(personaje['origin']['name'], style: const TextStyle(fontSize: 20,),),
                        ]
                      ),  
                      Row(
                        children:[
                          const SizedBox(height: 50,),
                          const Text('Locacion:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 20,),
                          Text(personaje['location']['name'], style: const TextStyle(fontSize: 20),),
                        ]
                      ),  
                      Row(
                        children:[
                          const SizedBox(height: 50,),
                          const Text('Genero:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 20,),
                          Text(personaje['gender'], style: const TextStyle(fontSize: 20),),
                        ]
                      ),     
                    ],
                  ),
                ),
              ),
            ) 
          ],
        )
      ),
    );
  }
}
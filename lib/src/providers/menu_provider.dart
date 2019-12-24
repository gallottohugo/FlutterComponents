import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
	List<dynamic> options = [];

	_MenuProvider(){
		loadData();
	}

	/* Synchronous
  	void _loadData() {
		rootBundle.loadString('data/menu_opts.json').then((data){
			Map dataMap = json.decode(data);
			options = dataMap['rutas'];
		});
	}
	*/ 

	// Asynchronous
  	Future<List<dynamic>> loadData() async {
		final response = await  rootBundle.loadString('data/menu_opts.json');
		Map dataMap = json.decode(response);
		options = dataMap['rutas'];
		return options;
	}
	 
}

final menuProvider = new _MenuProvider();
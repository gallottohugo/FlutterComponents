import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
	List<dynamic> options = [];

	_MenuProvider(){
		_loadData();
	}

  	void _loadData() {
		rootBundle.loadString('data/menu_opts.json').then((data){
			Map dataMap = json.decode(data);
			options = dataMap['rutas'];
		});
	}
}

final menuProvider = new _MenuProvider();
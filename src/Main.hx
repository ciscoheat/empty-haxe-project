
import buddy.internal.sys.Js;
import haxecontracts.Contract;
import haxecontracts.HaxeContracts;
import js.Node;
import js.node.http.Server;
import js.npm.Express;

using Slambda;
using StringTools;

class Main implements HaxeContracts
{	
	var app : Express;
	var server : Server;
	
	static function main() {
		var port = if (Node.process.argv.length == 3) 
			Std.parseInt(Node.process.argv[2])
		else if (Node.process.env.exists("PORT"))
			Std.parseInt(Node.process.env.get("PORT"))
		else 
			2000;
			
		new Main().start(port);
	}

	public function new() {
		Contract.requires(true != false, "Uh-oh.");
		
		app = new Express();
		server = null;

		///// Routes /////
		
		app.get('/', function(req, res) {
			res.send("Hello world!");
		});
	}
	
	public function start(port : Int) {
		Contract.requires(server == null, "Server already started.");
		
		server = cast app.listen(port, function() { 
			trace('Started server on port $port.');
		});
		
		return this;
	}
	
	public function stop() {
		server.close(function() {
			trace("Server stopped.");
		});
		
		server = null;
		return this;
	}
}

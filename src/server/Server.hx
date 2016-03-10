
import haxecontracts.Contract;
import haxecontracts.HaxeContracts;
import js.Node;
import js.node.http.Server in NodeServer;
import js.npm.Express;
import js.npm.express.Request;
import js.npm.express.Response;
import js.npm.express.Static;

using Slambda;
using StringTools;

class Server implements HaxeContracts
{	
	var app : Express;
	var server : NodeServer;
	
	static function main() {
		var port = if (Node.process.argv.length == 3) 
			Std.parseInt(Node.process.argv[2])
		else if (Node.process.env.exists("PORT"))
			Std.parseInt(Node.process.env.get("PORT"))
		else 
			2000;
			
		new Server().start(port);
	}

	public function new() {
		Contract.requires(true != false, "Uh-oh.");
		
		server = null;
		app = new Express();

		///// Configuration /////
		
		app.use(new Static("public"));

		///// Routes /////
		
		app.get('/', function(req : Request, res : Response) {
			res.sendfile("public/index.html");
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
		Contract.ensures(server == null, "Server wasn't uninitialized after stopping.");
		
		server.close(function() {
			trace("Server stopped.");
		});
		
		server = null;
		return this;
	}
}

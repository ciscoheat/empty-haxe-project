
import buddy.*;
import js.npm.Restler;

using buddy.Should;

class Tests extends BuddySuite implements Buddy<[Tests]>
{	
	public function new() {
		var server = new Server().start(2001);
		function url(path) return 'http://localhost:2001/$path';
		
		describe("Server", {
			it("should return Hello World from /helloworld", function(done) {
				Restler.get(url('helloworld')).on('complete', function(data : String) {
					data.should.be("Hello World!");
					done();
				}).on('timeout', fail);
			});
		});
		
		after({
			server.stop();
		});
	}
}

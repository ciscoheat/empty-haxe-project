
import buddy.*;
import js.npm.Restler;

using buddy.Should;

class Tests extends BuddySuite implements Buddy<[Tests]>
{	
	public function new() {
		var server = new Main().start(2001);
		var url = "http://localhost:2001/";
		
		describe("Server", {
			it("should return Hello world from /", function(done) {
				Restler.get(url).on('complete', function(data : String) {
					data.should.be("Hello world!");
					done();
				}).on('timeout', fail);
			});
		});
		
		after({
			server.stop();
		});
	}
}

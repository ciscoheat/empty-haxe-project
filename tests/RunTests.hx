import haxe.Timer;
import mithril.M;
import js.Browser;
import js.html.InputElement;

using buddy.Should;

class RunTests extends buddy.SingleSuite
{
	public function new() {
		describe("Main", {
			var app : Main;
			
			beforeEach({
				M.mount(Browser.document.body, app = new Main());
			});
			
			it("should have a dwarven king as user", function(done) {
				var inputField : InputElement = cast Browser.document.querySelector('input');
				
				app.user.name = "Thorin";
				M.redraw();
				
				Timer.delay(function() {
					inputField.value.should.be(app.user.name);
					done();
				}, 100);
			});
		});
	}
}

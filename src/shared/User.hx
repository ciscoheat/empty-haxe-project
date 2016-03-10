class User implements dataclass.DataClass
{
	public var name : String;
	public var birthYear : Int;

	#if server
	public var password : Null<String>;
	#end
}

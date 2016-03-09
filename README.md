An empty Haxe/Node.js project, to get started quickly.

A common first usage setup after cloning the repo:

```
renameproject my-project-name
haxe my-project-name.hxml
```

Then you need a PHP server running, pointing to the `bin` directory, or you can change your `.hxml` file to point to another directory. For Windows, [QuickPHP](http://www.zachsaw.com/?pg=quickphp_php_tester_debugger) is useful. If you need a full stack, use for example [EasyPHP](https://alternativeto.net/software/easyphp/) or Vagrant together with [viagrant](https://github.com/ciscoheat/viagrant).

`renameproject.bat` which is used to rename the project uses `fnr.exe` which is a rather large .exe file, they are both deleted after renaming. A nice contribution would be to make a Haxe file that does the same.

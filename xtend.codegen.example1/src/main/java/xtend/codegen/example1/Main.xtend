package xtend.codegen.example1

import com.beust.jcommander.JCommander
import com.beust.jcommander.Parameter
import com.beust.jcommander.converters.FileConverter
import java.io.File
import com.google.gson.Gson
import java.io.FileReader
import xtend.codegen.example1.model.Library
import com.google.common.io.Files
import java.nio.charset.Charset

class Main {
	@Parameter(names="-srcDir", converter=FileConverter, required=true) 
	File srcDir
	@Parameter(names="-targetDir", converter=FileConverter, required=true) 
	File targetDir

	Template template = new Template
	Gson gson = new Gson
	
	def static void main(String[] args) {
		var Main main = new Main()
		new JCommander(main, args)
		main.run()
	}

	def void run() {
		targetDir.mkdirs
		
		srcDir.listFiles.filter[name.endsWith(".json")].forEach[
			val lib = gson.fromJson(new FileReader(it), Library)
			val content = template.generateHTML(lib)
			val targetFile = new File(targetDir, lib.name+".html")
			Files.write(content, targetFile, Charset.defaultCharset)
		]
	}
}

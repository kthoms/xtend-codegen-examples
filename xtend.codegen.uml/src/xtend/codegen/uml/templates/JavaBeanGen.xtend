package xtend.codegen.uml.templates

import javax.inject.Inject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.uml2.uml.Class
import org.eclipse.xtext.generator.IFileSystemAccess
import org.eclipse.xtext.generator.IGenerator

class JavaBeanGen implements IGenerator {
	@Inject extension Naming
	
	override doGenerate(Resource input, IFileSystemAccess fsa) {
		input.allContents.filter(Class).forEach[
			val content = generate
			fsa.generateFile(packagePath+"/"+name+".java", content)
		]
	}
	
	def generate (Class it) '''
		package «nearestPackage.qualifiedName»;
		
		public class «name» «IF !superClasses.empty» extends «superClasses.head.qualifiedName»«ENDIF»{
			«FOR a: ownedAttributes»
				private «a.type.qualifiedName» «a.name»;
			«ENDFOR»
		}
	'''
}
package xtend.codegen.uml.templates

import org.eclipse.xtext.generator.IGenerator
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IFileSystemAccess
import javax.inject.Inject
import org.eclipse.xtext.EcoreUtil2
import org.eclipse.uml2.uml.Class

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
			
		}
	'''
}
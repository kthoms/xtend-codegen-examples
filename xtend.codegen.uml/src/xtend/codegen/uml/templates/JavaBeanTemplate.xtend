package xtend.codegen.uml.templates

import javax.inject.Inject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IFileSystemAccess
import org.eclipse.xtext.generator.IGenerator

class JavaBeanTemplate implements IGenerator {
	@Inject extension Naming
	
	override doGenerate(Resource input, IFileSystemAccess fsa) {
		input.allContents.filter(org.eclipse.uml2.uml.Class).forEach[
			val content = generate
			fsa.generateFile(packagePath+"/"+name+".java", content)
		]
	}
	
	def generate (org.eclipse.uml2.uml.Class it) '''
		package «packageName»;
		
		public class «name» «IF !superClasses.empty» extends «superClasses.head.qualifiedName»«ENDIF»{
			«FOR a: ownedAttributes»
				private «a.typeName» «a.name»;
			«ENDFOR»

			«FOR a: ownedAttributes»
				public «a.typeName» get«a.name.toFirstUpper» () {
					return «a.name»;
				}
				public void set«a.name.toFirstUpper» («a.typeName» «a.name») {
					return this.«a.name» = «a.name»;
				}
			«ENDFOR»
		}
	'''
}
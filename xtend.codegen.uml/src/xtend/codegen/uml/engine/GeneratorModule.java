package xtend.codegen.uml.engine;

import org.eclipse.emf.ecore.EValidator;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.uml2.uml.UMLFactory;
import org.eclipse.uml2.uml.UMLPackage;
import org.eclipse.xtext.generator.IGenerator;
import org.eclipse.xtext.generator.IOutputConfigurationProvider;
import org.eclipse.xtext.naming.DefaultDeclarativeQualifiedNameProvider;
import org.eclipse.xtext.naming.IQualifiedNameProvider;
import org.eclipse.xtext.resource.IDefaultResourceDescriptionStrategy;
import org.eclipse.xtext.resource.IResourceFactory;
import org.eclipse.xtext.resource.IResourceServiceProvider;
import org.eclipse.xtext.resource.generic.AbstractGenericResourceRuntimeModule;
import org.eclipse.xtext.resource.generic.GenericResourceServiceProvider;
import org.eclipse.xtext.resource.impl.DefaultResourceDescriptionStrategy;
import org.eclipse.xtext.service.SingletonBinding;
import org.eclipse.xtext.validation.IResourceValidator;

import com.google.inject.Binder;
import com.google.inject.Singleton;

import xtend.codegen.uml.templates.Root;
import xtend.codegen.uml.validation.BasicConstraints;

public class GeneratorModule extends AbstractGenericResourceRuntimeModule {
	@Override
	public void configure(Binder binder) {
		super.configure(binder);
		binder.bind(IOutputConfigurationProvider.class).to(OutputConfigurationProvider.class).in(Singleton.class);
		binder.bind(UMLPackage.class).toInstance(UMLPackage.eINSTANCE);
		binder.bind(UMLFactory.class).toInstance(UMLFactory.eINSTANCE);
	}

	public Class<? extends IGenerator> bindIGenerator() {
		return Root.class;
	}

	public Class<? extends ResourceSet> bindResourceSet() {
		return ResourceSetImpl.class;
	}

	@Override
	protected String getFileExtensions() {
		return "uml";
	}

	@Override
	protected String getLanguageName() {
		return "uml";
	}

	public Class<? extends IDefaultResourceDescriptionStrategy> bindIDefaultResourceDescriptionStrategy() {
		return DefaultResourceDescriptionStrategy.class;
	}

	@Override
	public Class<? extends IQualifiedNameProvider> bindIQualifiedNameProvider() {
		return DefaultDeclarativeQualifiedNameProvider.class;
	}

	public Class<? extends IResourceFactory> bindIResourceFactory() {
		return UMLResourceFactory.class;
	}

	@Override
	public Class<? extends IResourceServiceProvider> bindIResourceServiceProvider() {
		return GenericResourceServiceProvider.class;
	}

	@SingletonBinding(eager = true)
	public Class<? extends BasicConstraints> bindBasicConstraints() {
		return BasicConstraints.class;
	}

	public EValidator.Registry bindEValidatorRegistry() {
		return EValidator.Registry.INSTANCE;
	}
	
	// suppress validation of profiles
	public Class<? extends IResourceValidator> bindIResourceValidator () {
		return ResourceValidatorImplExt.class;
	}

}

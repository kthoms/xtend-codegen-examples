package xtend.codegen.uml.ui;
import java.util.Collections;
 
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EReference;
import org.eclipse.ui.IEditorPart;
import org.eclipse.xtext.ui.editor.LanguageSpecificURIEditorOpener;
import org.eclipse.uml2.uml.editor.presentation.UMLEditor;
 
public class UmlEditorOpener extends LanguageSpecificURIEditorOpener {
 
    @Override
    protected void selectAndReveal(IEditorPart openEditor, URI uri,
            EReference crossReference, int indexInList, boolean select) {
        UMLEditor umlEditor = (UMLEditor) openEditor.getAdapter(UMLEditor.class);
        if (umlEditor != null) {
            EObject eObject = umlEditor.getEditingDomain().getResourceSet().getEObject(uri, true);
            umlEditor.setSelectionToViewer(Collections.singletonList(eObject));
        }
    }
 
}
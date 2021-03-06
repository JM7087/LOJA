/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cdc.util;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
/**
 *
 * @author vanilson
 */
public class Upload {
    
    public Map<String, String> parametros = new HashMap<>();
    public final String pasta;//armazenará a pasta destino
    
    public Upload(String folder){
        pasta = folder;
        parametros = new HashMap<>();
    }
    
    public Map getParametros(){
        return parametros;
    }
    
    public boolean anexos(HttpServletRequest request) throws Exception{
        request.setCharacterEncoding("ISO-8859-1");
        if (ServletFileUpload.isMultipartContent(request)) {
            int cont = 0;
            ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
            List fileItemsList = null;
            try {
                fileItemsList = servletFileUpload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            String optionalFileName = "";
            FileItem fileItem = null;
            Iterator it = fileItemsList.iterator();
            do {
                //cont++;
                FileItem fileItemTemp = (FileItem) it.next();
                if (fileItemTemp.isFormField()) {
                    if (fileItemTemp.getFieldName().equals("file")) {
                        optionalFileName = fileItemTemp.getString();
                    }
                    parametros.put(fileItemTemp.getFieldName(), fileItemTemp.getString());            
                } else {
                    fileItem = fileItemTemp;
                }
                if (cont != (fileItemsList.size())) {
                    if (fileItem != null) {
                        String fileName = fileItem.getName();
                        if (fileItem.getSize() > 0) {
                            if (optionalFileName.trim().equals("")) {
                                fileName = FilenameUtils.getName(fileName);
                            } else {
                                fileName = optionalFileName;
                            }
                            String dirName = request.getServletContext().getRealPath(pasta);                            
                            File saveTo = new File(dirName +"/"+ fileName);
                            //verificando se a pasta existe. Caso contrário, criará ela
                            File pasta = new File(dirName);
                            if (!pasta.exists())
                                pasta.mkdirs();//criando a pasta
                            
                            parametros.put("foto", fileName);  
                            
                            try {
                                fileItem.write(saveTo);//Escrevendo o arquivo temporário no diretório correto
                            } catch (Exception e) {
                            }
                        }
                    }
                }
                cont++;
            } while (it.hasNext());
            return true;
        } else {
            return false;
        }    
    }
    public boolean anexos(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (ServletFileUpload.isMultipartContent(request)) {
            int cont = 0;
            ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
            List fileItemsList = null;
            try {
                fileItemsList = servletFileUpload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            String optionalFileName = "";
            FileItem fileItem = null;
            Iterator it = fileItemsList.iterator();
            do {
                //cont++;
                FileItem fileItemTemp = (FileItem) it.next();
                if (fileItemTemp.isFormField()) {
                    if (fileItemTemp.getFieldName().equals("file")) {
                        optionalFileName = fileItemTemp.getString();
                    }
                } else {
                    fileItem = fileItemTemp;
                }
                if (cont != (fileItemsList.size())) {
                    if (fileItem != null) {
                        String fileName = fileItem.getName();
                        if (fileItem.getSize() > 0) {
                            if (optionalFileName.trim().equals("")) {
                                fileName = FilenameUtils.getName(fileName);
                            } else {
                                fileName = optionalFileName;
                            }
                            String dirName = request.getServletContext().getRealPath(pasta);
                            File saveTo = new File(dirName + fileName);
                            //System.out.println("caminho: " + saveTo.toString() );
                            try {
                                fileItem.write(saveTo);
                            } catch (Exception e) {
                            }
                        }
                    }
                }
                cont++;
            } while (it.hasNext());
            return true;
        } else {
            return false;
        }
    }
}

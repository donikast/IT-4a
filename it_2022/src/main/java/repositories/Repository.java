package repositories;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.Set;

import javax.xml.bind.JAXBException;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.xml.sax.SAXException;

import models.User;
import xml.XMLWorker;

@XmlRootElement(name="users")
@XmlAccessorType(XmlAccessType.FIELD)
public class Repository {
	
	private static Repository instance = null;
	
	@XmlElement(name="user")
	private static Set<User> collection = new HashSet<User>();
	static int index=1;
	private static String pathToXmlFile = "C:\\Users\\MYPC\\git\\repository28\\it_2022\\src\\xml\\storage.xml";
	private static String pathToSchema = "C:\\Users\\MYPC\\git\\repository28\\it_2022\\src\\xml\\schema.xsd";

	private Repository() {}
	
	public static Repository getInstance() {
		if (instance == null) {
		
					XMLWorker worker = new XMLWorker();
				
					try {
						instance = worker.readFromXmlFile(pathToXmlFile,pathToSchema);
					} catch (FileNotFoundException | UnsupportedEncodingException | JAXBException | SAXException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					index=collection.size()+1;
				
					
				//	instance = new Repository();
		}
		return instance;
	}
	
	public void addUser(User user) {
		user.setId(index++);
		collection.add(user);
		updateXmlFile();
	}
	
	public boolean ifExist(User user) {
		return collection.contains(user);
	}
	
	public User getUserByUsername(String username) {
		for(User u:collection) {
			if(u.getUsername().equals(username)) {
				return u;
			}
		}
		return null;
	}
	
	public User getUserById(int id) {
		for(User u:collection) {
			if(u.getId()==id) {
				return u;
			}
		}
		return null;
	}
	
	public void updateXmlFile() {
		XMLWorker worker = new XMLWorker();
		try {
			worker.writeToXmlFile(pathToXmlFile, this);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

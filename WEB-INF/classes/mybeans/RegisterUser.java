package mybeans;
import java.sql.*;
public class RegisterUser {
	private String fname;
	private String lname;
	private String username;
	private String mobno;
	private String email;
	private String dob;
	private String gender;
	private String state;
	private String district;
	private String taluka;
	private String crop;
	private String area;
	private String notes;
	private int success;
	private String status;
	
	 public RegisterUser()
	 {
	 	fname = "";
	 	lname ="";
	 	username= "";
	 	mobno = "";
	 	email = "";
	 	dob = "";
	 	gender = "";
	 	state = "";
	 	district = "";
	 	taluka = "";
	 	crop = "";
	 	area = "";
	 	notes = "Applied";
	 	success = 0;
	 	status = "failed";
	 }

	public String getStatus() {
		return status;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public void setTaluka(String taluka) {
		this.taluka = taluka;
	}

	public void setCrop(String crop) {
		this.crop = crop;
	}

	public void setArea(String area) {
		this.area = area;
		insertData();
	}
	 
	 private void insertData()
	 {
		 Connection con;
		 PreparedStatement pst;
		 
	 
		 try
	     {
			 	Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udbhav?user=root&password=kunal123&useSSL=false&allowPublicKeyRetrieval=true");
	            pst = con.prepareStatement("insert into regusers values(?,?,?,?,?,?);");
	            pst.setString(1,username);
	            pst.setString(2,fname);
	            pst.setString(3,lname);
	            pst.setString(4,mobno);
	            pst.setString(5,email);
	            pst.setString(6,gender);
	            int no=pst.executeUpdate();
	            if(no>0)
	            {
	                success +=1;
	            }
	            pst = con.prepareStatement("insert into userpersonal values(?,?,?,?,?,?,?,?);");
	            pst.setString(1,username);
	            pst.setString(2,dob);
	            pst.setString(3,state);
	            pst.setString(4,district);
	            pst.setString(5,taluka);
	            pst.setString(6,crop);
	            pst.setString(7,area);
	            pst.setString(8,notes);
	            no=pst.executeUpdate();
	            if(no>0)
	            {
	                success += 1;
	            }
	            if(success == 2)
	            {
	            	status = "successful";
	            }
	            else
	            {
	            	status = "failed";
				}
				con.close();
	     }
		 catch(Exception e)
		 {
			 status = "failed";
		 }
	 }
}
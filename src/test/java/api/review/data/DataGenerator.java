package api.review.data;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;

public class DataGenerator {


	public  static String getEMAIL() {
		
		Faker faker = new  Faker();
	return faker.name().firstName()
			+ faker.name().lastName()+ "@gmail.com";
	}
	public  static String getphoneNUMBER() {
		Faker faker = new  Faker();
	return faker.phoneNumber().cellPhone();
			
	}

	public  static String getfirstNAME() {
		Faker faker = new  Faker();
	return faker.name().firstName();
			

	}

	public  static String getlastNAME() {
		Faker faker = new  Faker();
	return faker.name().lastName();

	}
	public static String getDOB() {
	    Faker faker = new Faker(); 
	    Date date = faker.date().birthday();
	    SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
	    return format.format(date);
	}
	  public static String getGender() {
          Faker faker = new Faker();
          return faker.name().suffix();

      }

      public static String getCITY() {
          Faker faker = new Faker();
          return faker.address().cityName();


      }
      public static String addressTYPE() {
          Faker faker = new Faker();
          return faker.address().buildingNumber();

      }
      public static String getEmployment() {
          Faker faker = new Faker();
          return faker.job().field();

      }
      public static String getCountryCODE() {
          Faker faker = new Faker();
          return faker.address().countryCode();

      }

      public static String getZipcode() {
          Faker faker = new Faker();
          return faker.address().zipCode();
      }
      public static String PhoneExtension() {
          Faker faker = new Faker();
          return faker.phoneNumber().extension();

      }

  }



package tiger.api.Review.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunnerTwo {
	
		@Karate.Test

	    public Karate runTest() {
	        return Karate.run("classpath:features")
	                .tags("@endToEndTwo");
	    }

	}


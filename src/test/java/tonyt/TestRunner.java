package tonyt;
import com.intuit.karate.junit5.Karate;
class TestRunner {       
    //run the entire .feature file (testapi.feature)
    @Karate.Test
    Karate runTestApi() {
        return Karate.run("testapi").relativeTo(getClass());
    }

    @Karate.Test
    Karate runTestUi() {
        return Karate.run("testui").relativeTo(getClass());
    }

    //run a specific scenario on the .feature file that has a tag name "HelloWorld"
    @Karate.Test
    Karate runTestHelloWorld() {
        return Karate.run("testapi").tags("@HelloWorld").relativeTo(getClass());
    }
} 
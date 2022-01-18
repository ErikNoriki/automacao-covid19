import io.restassured.http.ContentType;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.jupiter.api.DisplayName;

import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;

public class validacaoCovid19Countries {

    @BeforeClass
    public static void Url(){
        baseURI = "https://corona.lmao.ninja";
        basePath = "/v3";
    }

    @Test
    @DisplayName("Valida Body API Covid 19 - Brasil")
    public void CT01ValidaBodyAPI(){
        given()
                //Visualiza a requisição da API
                .log().all()
                .contentType(ContentType.JSON)
        .when()
                .get("/covid-19/countries/Brazil")
        .then()
                //Visualiza o retorno da API
                .log().all()
                //Valida Status Code = 200 (OK)
                .statusCode(200)
                //Valida se o país buscado é o Brazil
                .body("country", is("Brazil"))
                .body("countryInfo._id", is(76))
                .body("countryInfo.iso2", is("BR"))
                .body("countryInfo.iso3", is("BRA"))
                .body("countryInfo.lat", is(-10))
                .body("countryInfo.long", is(-55))
                .body("countryInfo.flag", containsString("br.png"))
                //Valida o body da API verificando se não retorna vazio ou nulo
                .body("cases", is(not(emptyOrNullString())))
                .body("todayCases", is(not(emptyOrNullString())))
                .body("deaths", is(not(emptyOrNullString())))
                .body("todayDeaths", is(not(emptyOrNullString())))
                .body("recovered", is(not(emptyOrNullString())))
                .body("todayRecovered", is(not(emptyOrNullString())))
                .body("active", is(not(emptyOrNullString())))
                .body("critical", is(not(emptyOrNullString())))
                .body("casesPerOneMillion", is(not(emptyOrNullString())))
                .body("deathsPerOneMillion", is(not(emptyOrNullString())))
                .body("tests", is(not(emptyOrNullString())))
                .body("testsPerOneMillion", is(not(emptyOrNullString())))
                .body("population", is(not(emptyOrNullString())))
                .body("continent", is(not(emptyOrNullString())))
                .body("oneCasePerPeople", is(not(emptyOrNullString())))
                .body("oneDeathPerPeople", is(not(emptyOrNullString())))
                .body("oneTestPerPeople", is(not(emptyOrNullString())))
                .body("activePerOneMillion", is(not(emptyOrNullString())))
                .body("recoveredPerOneMillion", is(not(emptyOrNullString())))
                .body("criticalPerOneMillion", is(not(emptyOrNullString())))
        ;
    }

}

package openapi.com.employe.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.NativeWebRequest;
import java.util.Optional;
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2023-10-04T11:40:55.613-04:00[America/New_York]")

@Controller
@RequestMapping("${openapi.openapiOpenAPI30.base-path:/v1}")
public class EmployeeApiController implements EmployeeApi {

    private final NativeWebRequest request;

    @org.springframework.beans.factory.annotation.Autowired
    public EmployeeApiController(NativeWebRequest request) {
        this.request = request;
    }

    @Override
    public Optional<NativeWebRequest> getRequest() {
        return Optional.ofNullable(request);
    }

}

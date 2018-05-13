package controllers;

import play.mvc.Controller;
import play.mvc.Result;

public class Application extends Controller {
    public Result renderTestPage() {
        return ok(views.html.main.render());
    }
}

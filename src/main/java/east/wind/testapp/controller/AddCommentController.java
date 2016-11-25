package east.wind.testapp.controller;

import east.wind.testapp.entity.Comment;
import east.wind.testapp.services.api.CommentService;
import east.wind.testapp.util.ErrorObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created by pavel.klevakin on 24.11.2016.
 */
@Controller
@RequestMapping(value = "addComment")
public class AddCommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getAddCommendForm() {
        return new ModelAndView("addComment");
    }

    @ResponseBody
    @RequestMapping(value = "/ajax", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
    public ErrorObject postAddCommentAjax(@RequestBody Comment comment) {
        ErrorObject error = null;
        try {
            commentService.save(comment);
        } catch (Exception e) {
            error = new ErrorObject("Что то пошло не так!");
        }
        return error;
    }

    @RequestMapping(value = "/postAddedComment", method = RequestMethod.POST)
    public ModelAndView postAddComment(@ModelAttribute Comment comment) {
        ModelAndView mav = new ModelAndView("addComment");
        ErrorObject error = null;
        try {
            commentService.save(comment);
        } catch (Exception e) {
            error = new ErrorObject("Что то пошло не так!");
        }
        mav.addObject("ErrorObject", error);
        return mav;
    }
}

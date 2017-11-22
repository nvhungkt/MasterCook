/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_article;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author ahhun
 */
public class Tbl_ShortArticleDTO implements Serializable{
    private String articleID;
    private String title;
    private Timestamp dateTime;
    private String imageURL;

    public Tbl_ShortArticleDTO(String articleID, String title, Timestamp dateTime, String imageURL) {
        this.articleID = articleID;
        this.title = title;
        this.dateTime = dateTime;
        this.imageURL = imageURL;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
    
}

package com.zixue.shop.controller;

import java.util.Map;

import com.zixue.shop.bean.AJAXResult;

/**
 * 控制层父类：公用方法
 * @author 一只会飞的小猴子
 *
 */
public abstract class BaseController
{
    
    //创建一个共用的ThreadLocal 提供其他方法使用同一对象，避免其他线程混用
    private ThreadLocal< AJAXResult>  result = new ThreadLocal< AJAXResult>();
    /**
     * 创建AJAX 返回结果对象
     */
    protected void start()
    {
        
        result.set(new AJAXResult());
    }
    /**
     * 返回 AJAX 返回结果对象
     * @return
     */
    protected Object end()
    {
        return result.get();
    }
    /**成功
     * 设置 AJAX 返回结果对象
     */
    protected void success()
    {
        result.get().setSuccess(true);
    }
    /**自定义
     * 设置 AJAX 返回结果对象
     */
    protected void success(boolean flag)
    {
        result.get().setSuccess(flag);
    }
    /**失败
     * 设置 AJAX 返回结果对象
     */
    protected void fail()
    {
        result.get().setSuccess(false);
    }
    /**
     * 封装AJAX 返回结果Object对象
     */
    
    protected void setObject(Object object){
        result.get().setObject(object);
    }
    /**
     * 封装AJAX 返回结果Object对象
     */
    protected Object getObject(){
        return result.get().getObject();
    }
    
    /**
     * 封装AJAX 返回结果Map对象
     */
    
    protected void setMap(Map<String, Object> map){
        result.get().setMap(map);
    }
    /**
     * 封装AJAX 返回结果Map对象
     */
    protected Object getMap(){
        return result.get().getMap(); 
     }
    
}

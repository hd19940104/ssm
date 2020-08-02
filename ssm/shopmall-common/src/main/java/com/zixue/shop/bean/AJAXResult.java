package com.zixue.shop.bean;

import java.util.Map;

public class AJAXResult
{
    private Object object;
    private boolean success;
    private Map<String , Object> map;
    
    public Object getObject()
    {
        return object;
    }

    public void setObject(Object object)
    {
        this.object = object;
    }

    public Map<String, Object> getMap()
    {
        return map;
    }

    public void setMap(Map<String, Object> map)
    {
        this.map = map;
    }

    public boolean isSuccess()
    {
        return success;
    }

    public void setSuccess(boolean success)
    {
        this.success = success;
    }
    
}

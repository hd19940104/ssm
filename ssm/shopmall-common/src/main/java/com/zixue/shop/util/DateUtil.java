package com.zixue.shop.util;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/** 
 * @author 一只会飞的小猴子
 * 日期转换工具类 
 */
public class DateUtil
{
    private static SimpleDateFormat second    = new SimpleDateFormat("yy-MM-dd hh:mm:ss");
    
    private static SimpleDateFormat day       = new SimpleDateFormat("yyyy-MM-dd");
    
    private static SimpleDateFormat detailDay = new SimpleDateFormat("yyyy年MM月dd日");
    
    private static SimpleDateFormat fileName  = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
    
    private static SimpleDateFormat tempTime  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
    private static SimpleDateFormat excelDate = new SimpleDateFormat("yyyy/MM/dd");
    
    /** 
     * 将日期格式转换成yyyy-MM-dd HH:mm:ss的字符串格式 
     * 返回值如：2010-10-06 23:23:12
     * @param time 要转换的日期 
     * @return 
     */
    public static String dateToString(Date time)
    {
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //定义将日期格式要换成的格式  
        String stringTime = formatter.format(time);
        
        return stringTime;
        
    }
    
    /** 
     * 将日期格式转换成yyyyMMdd的字符串格式 
     * 返回值如：2010-10-06 
     * @param time 要转换的日期 
     * @return 
     */
    public static String dateTimeToString(Date time)
    {
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd"); //定义将日期格式要换成的格式  
        String stringTime = formatter.format(time);
        
        return stringTime;
        
    }
    
    /** 
     * 将日期格式转换成yyyy-MM-dd的字符串格式 
     * 返回值如：2010-10-06 
     * @param time 要转换的日期 
     * @return 
     */
    public static Date dateToDate(Date time)
    {
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); //定义将日期格式要换成的格式  
        String stringTime = formatter.format(time);
        Date date = null;
        try
        {
            date = formatter.parse(stringTime);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        return date;
        
    }
    
    /** 
     * 得到当前时间，以字符串表示 
     * @return 
     */
    public static String getDate()
    {
        Date date = new Date();
        return DateUtil.dateToString(date);
    }
    
    /** 
     * 格式化excel中的时间 
     * @param date 
     * @return 
     */
    public static String formatDateForExcelDate(Date date)
    {
        return excelDate.format(date);
    }
    
    /** 
     * 将日期格式化作为文件名 
     * @param date 
     * @return 
     */
    public static String formatDateForFileName(Date date)
    {
        return fileName.format(date);
    }
    
    /** 
     * 格式化日期(精确到秒) 
     *  
     * @param date 
     * @return 
     */
    public static String formatDateSecond(Date date)
    {
        return second.format(date);
    }
    
    /** 
     * 格式化日期(精确到秒) 
     *  
     * @param date 
     * @return 
     */
    public static String tempDateSecond(Date date)
    {
        return tempTime.format(date);
    }
    
    public static Date tempDateSecond(String str)
    {
        try
        {
            return tempTime.parse(str);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        return new Date();
    }
    
    /** 
     * 格式化日期(精确到天) 
     *  
     * @param date 
     * @return 
     */
    public static String formatDateDay(Date date)
    {
        return day.format(date);
    }
    
    /** 
     * 格式化日期(精确到天) 
     *  
     * @param date 
     * @return 
     */
    public static String formatDateDetailDay(Date date)
    {
        return detailDay.format(date);
    }
    
    /** 
     * 将double类型的数字保留两位小数（四舍五入） 
     *  
     * @param number 
     * @return 
     */
    public static String formatNumber(double number)
    {
        DecimalFormat df = new DecimalFormat();
        df.applyPattern("#0.00");
        return df.format(number);
    }
    
    /** 
     * 将字符串转换成日期 
     *  
     * @param date 
     * @return 
     * @throws Exception 
     */
    public static Date formateDate(String date) throws Exception
    {
        return day.parse(date);
    }
    
    /** 
     * 将字符日期转换成Date 
     * @param date 
     * @return 
     * @throws Exception 
     */
    public static Date parseStringToDate(String date) throws Exception
    {
        return day.parse(date);
    }
    
    public static String formatDoubleNumber(double number)
    {
        DecimalFormat df = new DecimalFormat("#");
        return df.format(number);
    }
}

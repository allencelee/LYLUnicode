# HYBUnicodeReadable
解决打印日志对于Unicode编码不能正常显示中文的问题，只需要将文件导入工程，不需要引用，就能达到打印日志显示Unicode编码中文数据

#用途

在开发中，通常希望在console中打印出的信息能够显示出Unicode编码对应的中文，由此作者研究了一下如何解决此问题。
在这里，将此解决方案贡献给大家，如果觉得有用，请给个star!

#安装使用

直接下载源代码然后拖入工程即可！！！

>注意：不需要引入头文件一样可以使用的！！！

#效果图

![image](https://github.com/CoderJackyHuang/HYBUnicodeReadable/blob/master/screenshot.gif)

#version 1.0

增加对NSData类型的数据的可视化打印，如下：

```
NSString *str = @"我是转换成data格式的字符串";
  NSData *dataString = [NSData dataWithBytes:str.UTF8String length:str.length];
  NSDictionary *dataSet = @{@"key": @"字典转成data",
                            @"key1": @"在set、数组、字典中嵌套"};
  NSData *dataSetItem = [NSJSONSerialization dataWithJSONObject:dataSet options:NSJSONWritingPrettyPrinted error:nil];
  
  NSMutableSet *set = [NSMutableSet setWithArray:@[@"可变集合", @"字典->不可变集合->可变集合", dataSetItem]];
  NSDictionary *dict = @{@"name"  : @"某某",
                         @"title" : @"http://www.cnblogs.com/allencelee/",
                         @"count" : @(11),
                         @"dataString" : dataString,
                         @"results" : [NSSet setWithObjects:@"集合值1", @"集合值2", set , nil],
                         @"summaries" : @[@"sm1", @"sm2", @{@"keysm": @{@"stkey": @"字典->数组->字典->字典"}}, dataSetItem],
                         @"parameters" : @{@"key1" : @"value1", @"key2": @{@"key11" : @"value11", @"key12" : @[@"三层", @"字典->字典->数组"]}, @"key13": dataSetItem},
                         @"hasBug": @[@"YES",@"NO"],
                         @"contact" : @[@"关注博客地址：http://www.cnblogs.com/allencelee/" , @"关注GITHUB：https://github.com/allencelee"]};
  NSLog(@"%@", dict);
```

打印结果为：

```
2015-12-31 16:47:42.352 demo[58176:2693559] 	{
	hasBug = 	(
		"YES",
		"NO",
	),
	dataString = "我是转换成",
	title = "http://www.cnblogs.com/allencelee/",
	count = 11,
	results = 	{(
		"集合值2",
		"集合值1",
			{(
			"可变集合",
			"字典->不可变集合->可变集合",
				{
				key = "字典转成data",
				key1 = "在set、数组、字典中嵌套",
			},
		)},
	)},
	summaries = 	(
		"sm1",
		"sm2",
			{
			keysm = 	{
				stkey = "字典->数组->字典->字典",
			},
		},
			{
			key = "字典转成data",
			key1 = "在set、数组、字典中嵌套",
		},
	),
	contact = 	(
		"关注博客地址：http://www.cnblogs.com/allencelee/",
		"关注GITHUB：https://github.com/allencelee",
	),
	name = "某某",
	parameters = 	{
		key1 = "value1",
		key13 = 	{
			key = "字典转成data",
			key1 = "在set、数组、字典中嵌套",
		},
		key2 = 	{
			key11 = "value11",
			key12 = 	(
				"三层",
				"字典->字典->数组",
			),
		},
	},
}
```

#Version1.1

增加条件编译，只对Debug环境下起作用

#讲解

为了更详细地说明如何使用，笔者写了一篇博文，大家可以阅读：https://www.cnblogs.com/allencelee/p/9400281.html

#维护

笔者会一直维护，如果使用过程中出现任何bug，请反馈给作者，谢谢您的支持！！！

如果好用  请给一个star，谢谢

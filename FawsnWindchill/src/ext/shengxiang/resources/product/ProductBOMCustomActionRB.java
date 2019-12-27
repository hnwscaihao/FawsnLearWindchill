package ext.shengxiang.resources.product;

import wt.util.resource.RBEntry;
import wt.util.resource.RBUUID;
import wt.util.resource.WTListResourceBundle;

/**
 * 2019/12/9  9:00
 * @author CaiHao
 *
 */
@RBUUID(value = "ext.goertekmpm.resource.ProductBOMCustomActionRB")
public class ProductBOMCustomActionRB extends WTListResourceBundle{

	@RBEntry("BOMImportManage")
	public static final String PRIVATE_CONSTANT_1 = "BOMImportResource.BOMImportManage.description";
	
	@RBEntry("fawsnlear/PartBom.png.png")
	public static final String PRIVATE_CONSTANT_2 = "resourceOp.resourceOptimizationAction.icon";
	@RBEntry("BOMImportManage")
	public static final String PRIVATE_CONSTANT_3 = "resourceOp.resourceOptimizationAction.title";
	@RBEntry("BOMImportManage")
	public static final String PRIVATE_CONSTANT_4 = "resourceOp.resourceOptimizationAction.tooltip";
	@RBEntry("height=680,width=1300") // 定义弹出框大小
	public static final String PRIVATE_CONSTANT_5 = "resourceOp.resourceOptimizationAction.moreurlinfo";
}

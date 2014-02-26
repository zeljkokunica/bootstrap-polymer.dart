library bs_constants;

class Constants {
  /**
   * Button types
   */
  static String BUTTON_TYPE_NORMAL = "btn btn-default";
  static String BUTTON_TYPE_PRIMARY = "btn btn-primary";
  static String BUTTON_TYPE_SUCCESS = "btn btn-success";
  static String BUTTON_TYPE_INFO = "btn btn-info";
  static String BUTTON_TYPE_WARNING = "btn btn-warning";
  static String BUTTON_TYPE_DANGER = "btn btn-danger";
  static List<String> BUTTON_TYPES = [BUTTON_TYPE_NORMAL, BUTTON_TYPE_PRIMARY, BUTTON_TYPE_SUCCESS, BUTTON_TYPE_INFO, BUTTON_TYPE_WARNING, BUTTON_TYPE_DANGER];
  static String getValidButtonType(String desiredButtonType) {
    if (BUTTON_TYPES.contains(desiredButtonType)) {
      return desiredButtonType;
    }
    // TODO log warning
    return BUTTON_TYPES.first;
  }
  
  /**
   * Button sizes
   */
  static String BUTTON_SIZE_EXTRA_SMALL = "btn-xs";
  static String BUTTON_SIZE_SMALL = "btn-sm";
  static String BUTTON_SIZE_NORMAL = "";
  static String BUTTON_SIZE_LARGE = "btn-lg";
  static List<String> BUTTON_SIZES = [BUTTON_SIZE_NORMAL, BUTTON_SIZE_EXTRA_SMALL, BUTTON_SIZE_SMALL, BUTTON_SIZE_LARGE];  
  static String getValidButtonSize(String desiredButtonSize) {
    if (BUTTON_SIZES.contains(desiredButtonSize)) {
      return desiredButtonSize;
    }
    // TODO log warning
    return BUTTON_SIZES.first;
  }
}
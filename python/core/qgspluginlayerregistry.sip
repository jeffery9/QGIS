
class QgsPluginLayerType
{
%TypeHeaderCode
#include "qgspluginlayerregistry.h"
%End
  public:

    QgsPluginLayerType( QString name );
    virtual ~QgsPluginLayerType();

    QString name();

    /** return new layer of this type. Return NULL on error */
    virtual QgsPluginLayer* createLayer() /Factory/;

    /** show plugin layer properties dialog. Return false if the dialog cannot be shown. */
    virtual bool showLayerProperties( QgsPluginLayer* layer );

};


class QgsPluginLayerRegistry
{
%TypeHeaderCode
#include "qgspluginlayerregistry.h"
%End

  public:

    /** means of accessing canonical single instance  */
    static QgsPluginLayerRegistry* instance();

    ~QgsPluginLayerRegistry();

    /** add plugin layer type (take ownership) and return true on success */
    bool addPluginLayerType( QgsPluginLayerType* pluginLayerType /Transfer/ );

    /** remove plugin layer type and return true on success */
    bool removePluginLayerType( QString typeName );

    /** return plugin layer type metadata or NULL if doesn't exist */
    QgsPluginLayerType* pluginLayerType(QString typeName);

    /** return new layer if corresponding plugin has been found, else return NULL */
    QgsPluginLayer* createLayer(QString typeName) /Factory/;

  private:

    /** private since instance() creates it */
    QgsPluginLayerRegistry();
};

package org.jahia.modules.filter;

        import org.jahia.services.render.RenderContext;
        import org.jahia.services.render.Resource;
        import org.apache.commons.lang.StringUtils;
        import org.jahia.services.render.filter.AbstractFilter;
        import org.jahia.services.render.filter.RenderChain;

/**
 * AnimateFilter
 * <p>
 * Filter that add animation to the current resource.
 * <p>
 * If an animation parameter is found, the filter just adds it to the wrappers list.
 */
public class AnimateFilter extends AbstractFilter {
    public String prepare(RenderContext renderContext, Resource resource, RenderChain chain) throws Exception {
        String animation = resource.getNode().hasProperty("j:animation") ? resource.getNode().getPropertyAsString("j:animation") : "";
        if (!StringUtils.isEmpty(animation)) {
            resource.pushWrapper("animate");
        }
        return null;
    }
}
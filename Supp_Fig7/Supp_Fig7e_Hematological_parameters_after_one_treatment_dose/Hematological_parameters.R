rm(list = ls())

library(tidyverse)


df <- readRDS("rds/toxicity.rds")%>%
  select(-`BASO#(10^9/L)`, -`BASO%(%)`, -`[HYPER-He(%)]`)

df.lf <- df%>%
  pivot_longer(names_to = "Variable", values_to = "Value", !c(Day, sample_ID, condition))


df.scale.center <- df%>%
  group_by(Day)%>%
  mutate(across(`WBC(10^9/L)`:`[MCHC-O(g/L)]`, ~ scale(.x, scale=T, center=T)))%>%
  pivot_longer(names_to = "Variable", values_to = "Value", !c(Day, sample_ID, condition))


pdf("plots/Suppl_Fig7e.pdf", height=8, width=11)
df.scale.center[grepl("HGB.g|MONO#|NEUT#|NRBC#|PLT.10|RBC.10|RET#", df.scale.center$Variable),]%>%
  ggplot(aes(x = Day, y = Value, group = sample_ID, color = condition)) +
    theme_bw()+
    geom_point(alpha=0.5, size=0.8) +
    scale_color_manual(values=c("#3579C5", "#173E90", "black"))+
    scale_fill_discrete(labels = c("aEGFRvIII CAR", "aEGFRvIII-SGRP CAR", "Vehicle"))+
    stat_summary(fun=mean, geom="line", lwd=2,aes(group=condition))+
    scale_y_continuous(expand = expansion(add = 0.5))+
    facet_wrap(~Variable, ncol=3, scale="free")+
    ylab("Z-Score")+
    ggtitle("Hematological parameters after one treatment dose")
dev.off()

library(lme4)

slct.data <- df.scale.center[grepl("HGB.g|MONO#|NEUT#|NRBC#|PLT.10|RBC.10|RET#", df.scale.center$Variable),]

models <- list()

# Fit the mixed-effects model
mod <-lapply(unique(slct.data$Variable), function(x) { 
  m <- lme4::lmer(Value ~ Day * condition + (1 | sample_ID), data = df.scale.center[df.scale.center$Variable==x,])
  # summary(m)
  # models[[x]] <- as.data.frame(summary(m)[10])
  cbind(as.data.frame(summary(m)[10]))
  })
# Summary of the model
names(mod)<- unique(slct.data$Variable)


### NEUT
# interaction terms for Day 13 and Day 20 with the PBS condition have t-values greater than 2 -> might be considered significant
# The interaction terms for Day 13 and Day 20 with the PBS condition have t-values greater than 2, suggesting these interactions 
# might be significant. The specific estimates are 1.613 for Day 13 and 2.037 for Day 20, indicating that the NEUT#(10^9/L) is 
# significantly higher on these days in the PBS condition compared to the reference condition.

library(emmeans)

# Perform post-hoc tests for the model
m.neut <- lme4::lmer(Value ~ Day * condition + (1 | sample_ID), data = df.scale.center[df.scale.center$Variable==unique(slct.data$Variable)[5],])

emms <- emmeans(m.neut, pairwise ~ condition | Day)
summary(emms)

#summary
# Day 3: EGFRvIII-SGRP has a significantly higher mean than PBS.
# Day 13: Both EGFRvIII and EGFRvIII-SGRP have significantly lower means than PBS.
# Day 20: Both EGFRvIII and EGFRvIII-SGRP have significantly lower means than PBS.

